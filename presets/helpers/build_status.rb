require 'ostruct'

class BuildStatus

  def self.passing
   create('Passing','#3BB314')
  end

  def self.failing
    create('Failing','#CC0000')
  end

  def self.pending
    create('Pending','#E6B225')
  end

  def self.unstable
    create('Unstable','#D6C61A')
  end

  def self.error
    create('Error','#A8A7A5')
  end

  def self.unknown
    create('Unknown','#A8A7A5')
  end

  def self.key
    create('Build','#575354')
  end

  def self.value
    create('value','white')
  end

  def self.filename
    'build_status'
  end

  def self.create(name,colour)
    OpenStruct.new(:name => name,:colour => colour)
  end

end