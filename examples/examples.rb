require File.dirname(__FILE__) + '/../src/presets/github_build_status'

output_path = File.dirname(__FILE__) + '/images'

#------------------------------------------------------------------------------------------------------------------------
# build monitor status e.g. travis / jenkins
#------------------------------------------------------------------------------------------------------------------------

# using GithubBuildStatus convenience preset class
@build_status = GithubBuildStatus.new(output_path)

# using the build_status.gif as is meant for general use
@build_status.shield(BuildStatus.passing)

# using a filename override to produce a gif for each status type (probably only useful for examples)
# passing true allows the filename to be overridden to use the status name e.g passing.gif
# (otherwise the default is to overwrite the build_status.gif)
def generate(status)
  @build_status.shield(status,true)
end

generate(BuildStatus.passing)
generate(BuildStatus.failing)
generate(BuildStatus.pending)
generate(BuildStatus.unstable)
generate(BuildStatus.error)
generate(BuildStatus.unknown)

# using a custom shield
@shield = ShieldSystem.new(output_path)
@shield.github_shield('acceptance','Acceptance Tests',BuildStatus.passing.name,'#25B9E6',BuildStatus.passing.colour,'#0C0861','white')
@shield.github_shield('functional','Functional Tests','108 Passing','#DCB9ED',BuildStatus.passing.colour,'#0C0861','white')
@shield.github_shield('end-to-end','Number of End to End Tests:','500','#F08C4A','#F08C4A','#0C0861','#0C0861')

# changing height and font
@shield.github_shield('height','Dependencies','up-to-date',BuildStatus.key.colour,BuildStatus.passing.colour,BuildStatus.value.colour,'white','none',30,15,'arial',50)
@shield.github_shield('font','GPA','4.0','#25B9E6',BuildStatus.passing.colour,'#0C0861','white','none',20,13,'times')

# sparklines bar and pie
@shield.github_shield('build-history-label-bar','Build History','','#A8A7A5','#A8A7A5','white','white','none',28,13)
@shield.github_shield('build-history-label-pie','Passing Tests','','#A8A7A5','#A8A7A5','white','white','none',28,13)
@shield.sparkline_shield('build-history-bar',:bar,[100,100,90,80,90,90,100,120,120,90,80,70,100,120])
@shield.sparkline_shield('build-history-pie',:pie,[70])

#------------------------------------------------------------------------------------------------------------------------





