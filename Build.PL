
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Collection of Perl modules for Rinci and Riap",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Perinci",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Module::List" => 0,
    "Perinci::Sub::Wrapper" => 0,
    "Riap" => "1.1.0",
    "Rinci" => "1.1.5",
    "Test::More" => "0.96",
    "URI" => 0,
    "perl" => "5.010000"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
