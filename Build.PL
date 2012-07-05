
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "File::chdir" => 0,
    "Module::Build" => "0.3601",
    "Perinci::Examples" => "0.08",
    "Setup::File::Symlink" => 0,
    "Test::More" => "0.96"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Collection of Perl modules for Rinci and Riap",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci",
  "dist_version" => "0.24",
  "license" => "perl",
  "module_name" => "Perinci",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Class::Inspector" => 0,
    "DBD::SQLite" => 0,
    "DBI" => 0,
    "Data::Format::Pretty" => 0,
    "Data::Format::Pretty::Console" => "0.12",
    "Data::Format::Pretty::JSON" => "0.03",
    "Data::Format::Pretty::YAML" => "0.02",
    "File::Flock" => 0,
    "JSON" => 0,
    "Log::Any" => 0,
    "Module::List" => 0,
    "Perinci::Sub::Wrapper" => "0.20",
    "Riap" => "1.1.14",
    "Rinci" => "1.1.19",
    "SHARYANTO::Package::Util" => 0,
    "Tie::Cache" => 0,
    "URI" => 0,
    "perl" => "5.010000"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
