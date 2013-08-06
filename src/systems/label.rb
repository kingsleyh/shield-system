require 'RMagick'

class Label

  def initialize(label_name, label_text, label_colour, label_text_colour, background_colour, output_path, custom_font, height, font_size, font_family, buffer)
    @label_name = label_name
    @label_text = "   #{label_text}"
    @label_colour = label_colour
    @label_text_colour = label_text_colour
    $background_colour = background_colour
    @output_path = output_path
    @font_size = font_size.to_i
    @font_family = font_family
    @custom_font = custom_font
    @buffer = buffer.to_i
    @label_width = get_text_width(@label_text)
    @height = height.to_i
    @canvas = Magick::Image.new(@label_width, @height){ self.background_color = $background_colour }
    @canvas.alpha(Magick::ActivateAlphaChannel)
    @draw = Magick::Draw.new
    @corners = 3
  end

  def generate
    label_rectangle
    label_text
    publish
  end

  private

  def label_rectangle
    @draw.fill(@label_colour)
    @draw.stroke(@label_colour)
    @draw.stroke_width(1)
    @draw.roundrectangle(0, 0, @label_width, @height-1, @corners, @corners)
    @draw.stroke('transparent')
  end

  def label_text
    @draw.fill(@label_text_colour)
    set_font(@draw)
    @draw.pointsize=@font_size
    @draw.text_antialias(true)
    @draw.font_style(Magick::NormalStyle)
    @draw.font_weight(Magick::BoldWeight)
    @draw.gravity(Magick::WestGravity)
    @draw.text(0, 0, @label_text)
  end

  def publish
    @draw.draw(@canvas)
    @canvas.write(@output_path + '/' + @label_name + '.gif')
  end

  def get_text_width(text)
    canvas = Magick::Image.new(100, 100){ self.background_color = 'transparent' }
    canvas.alpha(Magick::ActivateAlphaChannel)
    label = Magick::Draw.new
    set_font(label)
    label.pointsize=@font_size
    label.text_antialias(true)
    label.font_style(Magick::NormalStyle)
    label.font_weight(Magick::BoldWeight)
    label.gravity(Magick::WestGravity)
    label.text(0, 0, text)
    metrics = label.get_type_metrics(canvas, text)
    metrics.width.to_i + @buffer
  end

  def set_font(parent)
    if @custom_font.nil?
      parent.font_family(@font_family)
    else
      parent.font = @custom_font
    end
  end

end






