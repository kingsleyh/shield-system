require 'sparklines'
require 'RMagick'

class SparklineShield

  def initialize(shield_name, chart_type, data, options, output_path)
    @shield_name = shield_name
    @chart_type = chart_type.to_sym
    @data = data
    @options = options
    @output_path = output_path
    @shield_list = [:bar,:pie]
  end

  def generate
    raise ArgumentError, "Chart type: #{@chart_type} not supported - please use one of: #{@shield_list}" unless @shield_list.include?(@chart_type)
    send @chart_type
  end

  def bar
    Sparklines.plot_to_file(@output_path + "/#{@shield_name}.gif",
                            @data, bar_default_options.merge(@options))
  end

  def bar_default_options
    {
        :type => 'bar',
        :below_color => 'blue',
        :above_color => 'orange',
        :upper => 0,
        :step => 6,
        :height => 30,
    }
  end

  def pie
    Sparklines.plot_to_file(@output_path + "/#{@shield_name}.gif",
                            @data,
                            pie_default_options.merge(@options))
  end

  def pie_default_options
    {
        :type => 'pie',
        :share_color => '#3BB314',
        :remain_color => '#C8EDFA',
        :diameter => 30

    }
  end

end