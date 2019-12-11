require_relative "song"

class MP3Importer
    attr_reader :path, :files

    def initialize(path)
        @path = path
        @files = []
        Dir.foreach(path) do |filename|
            if filename != "." && filename != ".."
                @files.push(filename)
            end
        end
    end 

    def import
        @files.each{|file| Song.new_by_filename(file)}
    end
end