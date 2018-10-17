class Pokemon

  attr_accessor :id, :name, :type, :db

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
    sql = "SELECT * FROM pokemon WHERE id = (?)"
    results = db.execute(sql, id).flatten
    Pokemon.new(id: results[0], name: results[1], type: results[2], db: db)
  end
end
