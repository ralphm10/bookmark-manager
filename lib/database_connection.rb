class DatabaseConnection

  def self.setup(db)
    @connection = PG.connect(dbname: db)
  end 

  def self.connection
    @connection
  end 

  def self.query(query_string)
    @connection.query(query_string)
  end 
end 