require File.dirname(__FILE__) + '/systems/github_shield'
require File.dirname(__FILE__) + '/systems/sparkline_shield'

class ShieldSystem

  def initialize(output_path)
    @output_path = output_path
  end

  def github_shield(shield_name, key_text, status_text, key_colour, status_colour, key_text_colour, status_text_colour, height=18, font_size=11, font_family='arial', buffer=5)
    GithubShield.new(shield_name, key_text, status_text, key_colour, status_colour, key_text_colour, status_text_colour, @output_path, height, font_size, font_family, buffer).generate
  end

  def sparkline_shield(shield_name,chart_type,data,options={})
    SparklineShield.new(shield_name,chart_type,data,options,@output_path).generate
  end


end

