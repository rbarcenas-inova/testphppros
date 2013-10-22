#!/usr/bin/perl

####################################################################
###
###
###
###    STOP !!!!!!!!!!!!!
###
###
###    NO MODIFICAR RUTINAS EN ESTA APLICACION
###
###
###    SOLO PARA PRUEBA AGREGAR 
###    &cgierr('P-Nombre:comments')  TEMPORALMENTE!!!!!!!!!
###
###
###
####################################################################
	
	### Auto Get Home_dir
	#
	# Tip: Aqui la ruta del script es cgi-bin/
	#
	use Cwd;
	my $dir = getcwd;
	my($b_cgibin,$a_cgibin) = split(/cgi-bin/,$dir);
	my $home_dir = $b_cgibin.'cgi-bin/common';

	## Load Libs
	opendir (my $libdir, "$home_dir/subs/libs") || &cgierr("Unable to open directory $home_dir/subs/libs",604,$!);
		@files = readdir($libdir);		# Read in list of files in directory..
	closedir (LIBDIR);
	
	FILE: foreach my $file (@files) {
		next if ($file !~ /^lib\./);
		require ("$home_dir/subs/libs/$file");
	}

	## Load {e} libs
	if ($in{'e'}>0){
		if (-e "$home_dir/subs/e/e$in{'e'}.dbman.pl" and $0 =~ /dbman/){
			require ("$home_dir/subs/e/e$in{'e'}.dbman.pl");
		}elsif(-e "$home_dir/subs/e/e$in{'e'}.admin.pl"){
			require ("$home_dir/subs/e/e$in{'e'}.admin.pl");
		}
		## Common Libs
		if(-e "$home_dir/subs/e/e$in{'e'}.common.pl"){
			require ("$home_dir/subs/e/e$in{'e'}.common.pl");
		}
		## Functions Libs
		if(-e "$home_dir/subs/e/e$in{'e'}.functions.pl"){
			require ("$home_dir/subs/e/e$in{'e'}.functions.pl");
		}
	}


1;