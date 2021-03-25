class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    end

    def self.find(id, db)
        found = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: id, name: found[1], type: found[2], db: db)
    end
    def self.all

    end
end
