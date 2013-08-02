# Generate Status Badge Images

Shield-System lets you generate github style status images for use anywhere e.g. custom badges with tests results.

[![Build Status](https://travis-ci.org/masterthought/thundercat.png?branch=master)](https://travis-ci.org/masterthought/thundercat)

## Background

I really like the travis,code climate and other services badges you can put on your github README and I wanted to make some I could use on
my internal projects and also be able to change the colours and text easily to make badges with different information for different sets of
tests and statuses.

## Install

gem install shield-system

## Usage

### Create build status preset shields

![Passing]
(https://raw.github.com/masterthought/shield-system/master/examples/images/passing.gif)

![Failing]
(https://raw.github.com/masterthought/shield-system/master/examples/images/failing.gif)

![Pending]
(https://raw.github.com/masterthought/shield-system/master/examples/images/pending.gif)

![Unstable]
(https://raw.github.com/masterthought/shield-system/master/examples/images/unstable.gif)

![Error]
(https://raw.github.com/masterthought/shield-system/master/examples/images/error.gif)

![Unknown]
(https://raw.github.com/masterthought/shield-system/master/examples/images/unknown.gif)

     require 'shield-system'
     require 'shield-system/presets/github_build_status'

     output_path = File.dirname(__FILE__)
     build_status = GithubBuildStatus.new(output_path)
     build_status.shield(BuildStatus.passing)

### Create custom shields

![Acceptance]
(https://raw.github.com/masterthought/shield-system/master/examples/images/acceptance.gif)

![Functional]
(https://raw.github.com/masterthought/shield-system/master/examples/images/functional.gif)

![EndtoEnd]
(https://raw.github.com/masterthought/shield-system/master/examples/images/end-to-end.gif)

### using a custom shield

     require 'shield-system'

     output_path = File.dirname(__FILE__)
     shield = ShieldSystem.new(output_path)
     shield.github_shield('acceptance','Acceptance Tests',BuildStatus.passing.name,'#25B9E6',BuildStatus.passing.colour,'#0C0861','white')
     shield.github_shield('functional','Functional Tests','108 Passing','#DCB9ED',BuildStatus.passing.colour,'#0C0861','white')
     shield.github_shield('end-to-end','Number of End to End Tests:','500','#F08C4A','#F08C4A','#0C0861','#0C0861')

### changing height and font

![Height]
(https://raw.github.com/masterthought/shield-system/master/examples/images/height.gif)

![Font]
(https://raw.github.com/masterthought/shield-system/master/examples/images/font.gif)

     shield.github_shield('height','Dependencies','up-to-date',BuildStatus.key.colour,BuildStatus.passing.colour,BuildStatus.value.colour,'white','none',30,15,'arial',50)
     shield.github_shield('font','GPA','4.0','#25B9E6',BuildStatus.passing.colour,'#0C0861','white','none',20,13,'times')

### Creating Sparklines

![Bar]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-bar.gif)
![Pie]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-pie.gif)

### sparklines bar and pie

     # labels
     shield.github_shield('build-history-label-bar','Build History','','#A8A7A5','#A8A7A5','white','white','none',28,13)
     shield.github_shield('build-history-label-pie','Passing Tests','','#A8A7A5','#A8A7A5','white','white','none',28,13)
     # sparklines
     shield.sparkline_shield('build-history-bar',:bar,[100,100,90,80,90,90,100,120,120,90,80,70,100,120])
     shield.sparkline_shield('build-history-pie',:pie,[70])

## Additional Info

github_shield takes several configuration parameters:

   github_shield(shield_name, key_text, status_text, key_colour, status_colour, key_text_colour, status_text_colour, background_colour='none', height=18, font_size=11, font_family='arial', buffer=5)

most are self explanatory but here's some clarification on the last ones:

  * background_colour = by default is 'none' but you can use this to set a specific colour
  * buffer = by default is 5 - this is width added to the text width for the key and value you supply. The calculation for text width doesn't seem to take into account the font used so
    when changing the font size the text doesn't line up correctly - you can increase the buffer to fix this if that happens.

## Develop

Interested in contributing? Great just let me know how you want to help.

