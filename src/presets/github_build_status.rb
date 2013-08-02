require File.dirname(__FILE__) + '/../shield_system'
require File.dirname(__FILE__) + '/../presets/helpers/build_status'

class GithubBuildStatus

  def initialize(output_path,background_colour='none')
    @shield = ShieldSystem.new(output_path)
    @background_colour = background_colour
  end

  def passing
    shield(BuildStatus.passing)
  end

  def failing
    shield(BuildStatus.failing)
  end

  def pending
    shield(BuildStatus.pending)
  end

  def unstable
    shield(BuildStatus.unstable)
  end

  def error
    shield(BuildStatus.error)
  end

  def unknown
    shield(BuildStatus.unknown)
  end

  def shield(status, override_filename=false)
    @shield.github_shield(override_filename ? status.name.downcase : BuildStatus.filename, BuildStatus.key.name, status.name,
                          BuildStatus.key.colour, status.colour, BuildStatus.value.colour, BuildStatus.value.colour, @background_colour)
  end

end


