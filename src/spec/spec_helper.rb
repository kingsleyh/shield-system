class VerifyImage

  def self.is_same(actual,expected)
    compare = `compare -metric rmse -subimage-search #{actual} #{expected} null: 2>&1`
    compare == "0 (0)\n" ? true : compare
  end

end

