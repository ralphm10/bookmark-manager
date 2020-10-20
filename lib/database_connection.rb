class DatabaseConnection

  def self.setup(db)
    @connection = PG.connect(dbname: "#{db}")
  end 
end 