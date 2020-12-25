require File.join(File.dirname(__FILE__), 'lib', 'tilia', 'v_object', 'version')
Gem::Specification.new do |s|
  s.name        = 'tilia-vobject'
  s.version     = Tilia::VObject::Version::VERSION
  s.licenses    = ['BSD-3-Clause']
  s.summary     = 'Port of the sabre-vobject library to ruby'
  s.description = "Port of the sabre-vobject library to ruby\n\nThe VObject library for PHP allows you to easily parse and manipulate iCalendar and vCard objects."
  s.author      = 'Jakob Sack'
  s.email       = 'tilia@jakobsack.de'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/tilia/tilia-vobject'
  s.add_runtime_dependency 'tilia-xml', '~> 1.3'
  s.add_runtime_dependency 'activesupport', '>= 4.0'
  s.add_runtime_dependency 'mail', '~> 2.6'
  s.add_runtime_dependency 'tzinfo', '~> 2.0'
  s.add_runtime_dependency 'rchardet', '~>1.6'
end
