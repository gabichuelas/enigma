class Key
  def self.make
    num = rand(99999).to_s
    num.prepend("0") if num.length == 4
    num
  end
end
