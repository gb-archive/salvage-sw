//  gbformat.cpp
//
//  Source file for Device-Independent Bitmap (DIB) API.  Provides
//  the following functions:
//

#include "stdafx.h"
#include "gbformat.h"
#include "dibapi.h"

#include <algorithm>
#include <utility>
#include <string>
#include <vector>
#include <sstream>
#include <cassert>

#include <memory.h>

void GBTile::set_color(
    unsigned char i,
    unsigned char j,
    unsigned char color // two bits
){
    m_data[i][0] |= (color & 01) << (7 - j);
    color >>= 1;
    m_data[i][1] |= (color & 01) << (7 - j);
}

bool GBTile::operator<(const GBTile & rhs) const {
    if(memcmp(m_data, rhs.m_data, sizeof(m_data)) < 0)
        return true;
    return false;
}
GBTile::GBTile(unsigned int i) :
    m_index(i)
{
    memset(m_data, 0, sizeof(m_data));
}

GBTile::GBTile(const GBTile & rhs) :
    m_index(rhs.m_index)
{
    memcpy(m_data, rhs.m_data, sizeof(m_data));
}

#define TILE_WIDTH 8
#define TILE_DEPTH 8
#define BITS_PER_PIXEL 2

bool GBData::append_bitmap(const char * name, LPSTR lpDIB){
    LPSTR pixels = FindDIBBits(lpDIB);
    unsigned int w = DIBWidth(lpDIB);
    unsigned int h = DIBHeight(lpDIB);
    unsigned int bpp = DIBBitsPerPixel(lpDIB);

    if(bpp < 1 || 8 < bpp)
        return false;

    m_bitmaps.push_back(GBBitmap(
        name,
        w / TILE_WIDTH, 
        h / TILE_WIDTH, 
        m_tile_map.size()
    ));
    // for each tile
    for(unsigned int i = 0; i < h; i += TILE_DEPTH){
        for(unsigned int j = 0; j < w; j += TILE_WIDTH){
            GBTile t(m_tile_data.size());
            for(unsigned int ti = 0; ti < TILE_DEPTH; ++ti){
                char * address = pixels + (( h - 1 - (i + ti)) * w + j) * bpp / 8;

                for(unsigned int tj = 0; tj < TILE_WIDTH;){
                    unsigned char color;
                    color = *address++;
                    if(4 == bpp){
                        unsigned char c1;
                        c1 = (color >> 4) & 0xf;
                        if(3 < c1)
                            c1 = 0;
                        t.set_color(ti, tj++, c1);
                        c1 = (color & 0xf);
                        if(3 < c1)
                            c1 = 0;
                        t.set_color(ti, tj++, c1);
                    }
                    else
                    if(8 == bpp){
                        if(3 < color)
                            color = 0;
                        t.set_color(ti, tj++, color);
                    }
                }
            }
            std::pair<std::set<GBTile>::iterator, bool> result = m_tile_data.insert(t);
            m_tile_map.push_back(result.first->m_index);
        }
    }
    return true;
}

std::ostream & operator<<(std::ostream & os, const GBTile & t){
    unsigned int count = sizeof(t.m_data) / sizeof(t.m_data[0][0]);
    const unsigned char * dptr = & t.m_data[0][0];
    os << "\t";
    while(count-- > 0){
        os << (unsigned int)*dptr++;
        if(count > 0)
            os << ',';
    }
    return os;
}

struct compare {
    bool operator()(const GBTile & lhs, const GBTile & rhs) const {
        return lhs.m_index < rhs.m_index;
    }
};

std::ostream & operator<<(std::ostream & os, const std::set<GBTile> & t){
    std::vector<GBTile> sv;
    std::copy(t.begin(), t.end(), back_inserter(sv));
    std::vector<GBTile>::iterator i = sv.begin();
    std::vector<GBTile>::iterator end = sv.end();
    std::sort(i, end, compare());
    while(i != end){
        os << *i;
        if(++i != end)
            os << ',';
        os << "\n";
    }
    return os;
}

std::ostream & operator<<(std::ostream & os, const std::list<int> & t){
    std::list<int>::const_iterator i = t.begin();
    std::list<int>::const_iterator end = t.end();
    while(i != end){
        os << '\t';
        for(unsigned int count = 16; count-- > 0;){
            os << (int)*i;
            if(++i == end)
                break;
            os << ',';
        }
        os << "\n";
    }
    return os;
}

std::ostream & operator<<(std::ostream & os, const GBBitmap & t){
    os << "const bitmap " << t.m_name << " = {" 
        << t.m_width << ", " 
        << t.m_depth << ", " 
        << t.m_tile_index 
        << "};\n";
    return os;
}

std::ostream & operator<<(std::ostream & os, const std::list<GBBitmap> & t){
    std::list<GBBitmap>::const_iterator i = t.begin();
    std::list<GBBitmap>::const_iterator end = t.end();
    while(i != end)
        os << *i++;
    return os;
}

std::ostream & operator<<(std::ostream & os, const GBData & t){
    os << "/* This file was created using Dib2GB version 1.0\n";
    os << " * total tile count count is " << t.m_tile_data.size() << "\n";
    os << " */\n\n";
    os << "#include \"bitmap.h\"\n\n";
    os << "const unsigned char " << t.m_name << '_' << "data[] = {\n";
    os << t.m_tile_data;
    os << "};\n";
    os << "const unsigned " 
        << ((t.m_tile_data.size() <= 256) ? "char " : "int ")
        << t.m_name << '_' << "map[] = {\n";
    os << t.m_tile_map;
    os << "};\n";
    os << t.m_bitmaps;
    return os;
}

struct prepend {
    const char * const m_prefix;
    void operator()(GBBitmap & b){
        b.m_name = std::string(m_prefix) + '_' + b.m_name;
    }
    prepend(const char * const s) :
        m_prefix(s)
    {}
};

void GBData::render(std::string & str){
    std::list<GBBitmap>::iterator begin = m_bitmaps.begin(); 
    std::list<GBBitmap>::iterator end = m_bitmaps.end(); 
    std::for_each(begin, end, prepend(m_name));
    std::ostringstream ss(std::ios_base::out);
    ss << *this;
    str = ss.str();
}
