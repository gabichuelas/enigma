class Key
  def self.make
    num = rand(99999).to_s
    num.prepend("0") until num.length == 5
    num
  end
end
