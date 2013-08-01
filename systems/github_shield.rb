require 'RMagick'

class GithubShield

  def initialize(shield_name, key_text, status_text, key_colour, status_colour, key_text_colour, status_text_colour, output_path, height, font_size, font_family, buffer)
    @shield_name = shield_name
    @key_text = "   #{key_text}"
    @status_text = "   #{status_text}"
    @key_colour = key_colour
    @status_colour = status_colour
    @key_text_colour = key_text_colour
    @status_text_colour = status_text_colour
    @output_path = output_path
    @font_size = font_size.to_i
    @font_family = font_family
    @buffer = buffer.to_i
    @key_width = get_text_width(@key_text)
    @status_width = get_text_width(@status_text)
    @width = @key_width + @status_width
    @height = height.to_i
    @canvas = Magick::Image.new(@width, @height)
    @draw = Magick::Draw.new
    @corners = 3
  end

  def generate
    key_rectangle
    status_rectangle
    bridge_rectangle
    key_text
    status_text
    publish
  end

  private

  def key_rectangle
    @draw.fill(@key_colour)
    @draw.stroke(@key_colour)
    @draw.stroke_width(1)
    @draw.roundrectangle(0, 0, @key_width, @height-1, @corners, @corners)
  end

  def status_rectangle
    @draw.fill(@status_colour)
    @draw.stroke('transparent')
    @draw.stroke_width(1)
    @draw.roundrectangle(@key_width, 0, @status_width+@key_width, @height-1, @corners, @corners)
  end

  def bridge_rectangle
    @draw.fill(@key_colour)
    @draw.stroke(@key_colour)
    @draw.stroke_width(3)
    @draw.rectangle(@key_width, 0, @key_width+1, @height-1)
    @draw.stroke('transparent')
  end

  def key_text
    @draw.fill(@key_text_colour)
    @draw.font_family(@font_family)
    @draw.font_size(@font_size)
    @draw.text_antialias(true)
    @draw.font_style(Magick::NormalStyle)
    @draw.font_weight(Magick::BoldWeight)
    @draw.gravity(Magick::WestGravity)
    @draw.text(0, 0, @key_text)
  end

  def status_text
    @draw.fill(@status_text_colour)
    @draw.font_family(@font_family)
    @draw.font_size(@font_size)
    @draw.text_antialias(true)
    @draw.font_style(Magick::NormalStyle)
    @draw.font_weight(Magick::BoldWeight)
    @draw.gravity(Magick::WestGravity)
    @draw.text(@key_width, 0, @status_text)
  end

  def publish
    @draw.draw(@canvas)
    @canvas.write(@output_path + '/' + @shield_name + '.gif')
  end

  def get_text_width(text)
    canvas = Magick::Image.new(100, 100)
    label = Magick::Draw.new
    label.font_family(@font_family)
    label.font_size(@font_size)
    label.text_antialias(true)
    label.font_style(Magick::NormalStyle)
    label.font_weight(Magick::BoldWeight)
    label.gravity(Magick::WestGravity)
    label.text(0, 0, text)
    metrics = label.get_type_metrics(canvas, text)
    metrics.width.to_i + @buffer
  end

end






