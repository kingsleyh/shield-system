class VerifyImage

  def self.is_same(actual,expected)
    compare = `compare -metric rmse -subimage-search #{actual} #{expected} null: 2>&1`
    compare.strip == "0 (0)" ? true : compare
  end

end

def assert_file_exists?(name)
  actual = @output_path + "/#{name}.gif"
  File.exists?(actual).should == true
  #expected = File.dirname(__FILE__)+"/../../examples/images/#{name}.gif"
  #VerifyImage.is_same(actual, expected).should == true
end
