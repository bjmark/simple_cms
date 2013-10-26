class User
  def initialize(id)
    @id = id.to_i
  end

  def self.find(id)
    User.new(id)
  end

  def role
    case @id
    when 0
      'not_member'
    when 1
      'member'
    when 2
      'admin'
    end
  end
end
