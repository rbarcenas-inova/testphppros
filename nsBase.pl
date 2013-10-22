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

	local ($home_dir) = '/home/www/domains/direksys.com/cgi-bin/common/subs';
	local	($uname)	=	 `uname -n`;
		
	if($uname =~ /sltv|n3|n4/){	
		$home_dir='/home/www/inn_domains/dev.direksys.com/cgi-bin/common/subs';
	}elsif($uname =~ /hawking|aa1|labtop/){	
		$home_dir='/home/www/domains_local/dev.direksys.com/cgi-bin/common/subs';
	}
	
	require "$home_dir/sub.finance.html.cgi";
	require "$home_dir/sub.finance_2.html.cgi";
	
	## Load Libs
	opendir (LIBDIR, "$home_dir/libs") || &cgierr("Unable to open directory $cfg{'auth_dir'}",604,$!);
		@files = readdir(LIBDIR);		# Read in list of files in directory..
	closedir (LIBDIR);

	FILE: foreach $file (@files) {
		next if ($file !~ /^lib\./);
		require "$home_dir/libs/$file";
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
