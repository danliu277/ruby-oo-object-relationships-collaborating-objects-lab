require_relative "artist"
require "pry"
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        data = file_name.split(" - ")
        song = Song.new(data[1])
        song.artist = Artist.new(data[0])
        return song
    end

    def artist_name=(name)
        artist = Artist.all.find{|x| x.name == name}
        if(artist)
            self.artist = artist
        else
            self.artist = Artist.new(name)
        end
    end
end