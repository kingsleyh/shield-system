class VerifyImage

  def self.is_same(actual,expected)
    result = `compare -metric MAE #{actual} #{expected} null: 2>&1`
    result == "0 (0)\n"
  end

end

