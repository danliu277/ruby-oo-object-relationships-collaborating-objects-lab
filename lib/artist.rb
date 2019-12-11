require_relative "song"

class Artist
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find{|artist| artist.name == name}
        if(!artist)
            artist = Artist.new(name)
        end
        return artist
    end

    def print_songs
        songs.each{|song| puts song.name}
    end
end