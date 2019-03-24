#pragma once
//  gbformat.cpp
//
//  Source file for Device-Independent Bitmap (DIB) API.  Provides
//  the following functions:
//

#include <string>
#include <set>
#include <list>

#define TILE_WIDTH 8
#define TILE_DEPTH 8
#define BITS_PER_PIXEL 2

struct GBTile {
    unsigned int m_index;
    unsigned char m_data[TILE_DEPTH][BITS_PER_PIXEL];
    // set one pixel in the tile
    void set_color(
        unsigned char i,
        unsigned char j,
        unsigned char color // two bits
    );
    bool operator<(const GBTile & rhs) const;
    GBTile(unsigned int i);
    GBTile(const GBTile & rhs);
};

struct GBBitmap {
    std::string m_name;
    unsigned int m_width;
    unsigned int m_depth;
    unsigned int m_tile_index;
    GBBitmap(
        const char * name, 
        unsigned char width, 
        unsigned char depth, 
        unsigned int tile_index
    ) :
        m_name(name),
        m_width(width),
        m_depth(depth),
        m_tile_index(tile_index)
    {}
};

struct GBData {
    friend class ostream;
    const char *m_name;
    std::set<GBTile> m_tile_data;
    std::list<int> m_tile_map;
    std::list<GBBitmap> m_bitmaps;
public:
    bool append_bitmap(const char * name, LPSTR lpDIB);
    void render(std::string & str);
    GBData(const char * name) :
        m_name(name)
    {
    }
};

