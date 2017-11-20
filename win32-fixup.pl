#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'NEWS'

require "../local-paths.lib";

$api_version = "1.0";
$pango_current_minus_age = 0;
$harfbuzz_version = "1.7.02";
$major = 1;
$minor = 7;
$micro = 2;
$interface_age = 2;
$current_minus_age = 0;
$exec_prefix = "lib";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$harfbuzz_version/g;
	    s/\@PANGO_API_VERSION@/$pango_api_version/g;
	    s/\@HARFBUZZ_API_VERSION@/$api_version/g;
	    s/\@HB_VERSION@/$harfbuzz_version/g;
	    s/\@HB_VERSION_MAJOR\@/$major/g;
	    s/\@HB_VERSION_MINOR\@/$minor/g;
	    s/\@HB_VERSION_MICRO\@/$micro/g;
	    s/\@HB_INTERFACE_AGE\@/$interface_age/g;
	    s/\@PANGO_CURRENT_MINUS_AGE@/$pango_current_minus_age/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@PERL_PATH@/$perl_path/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@PangoBuildProjectFolder@/$pango_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@prefix@/$prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@includedir@/$generic_include_folder/g;
	    s/\@libdir@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

process_file ("src/hb-version.h");
process_file ("src/harfbuzz.pc");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("msvc/harfbuzz.vsprops");
}