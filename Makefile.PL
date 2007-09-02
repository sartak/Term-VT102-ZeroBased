# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name           'Term-VT102-ZeroBased';
all_from       'lib/Term/VT102/ZeroBased.pm';

requires       '';

build_requires 'Test::More';

auto_install;
WriteAll;

