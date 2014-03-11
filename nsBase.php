<?php

	#####
	##### ToDo ) Cambiar la forma de determinar lo que contiene la variable $cfg_folder.
	####          Nota: La forma tiene que ser lo mas apegada posible a la solucion del archivo nsBase.new.pl
	#####

	#####
	##### Tip: Aqui la ruta del script es httpdcos/
	#####


	######################################################
	##### Configuration File
	######################################################
    if($local == "n3"){
          $cfg_folder        = "/home/www/inn_domains/dev.innovashop.tv/cgi-bin/nsc_admin/common/";
    }elseif($local == "s12.shoplatinotv.com"){
          $cfg_folder        = "/home/www/domains/innovashop.tv/cgi-bin/nsc_admin/common/";
    }elseif($local == "hawking" || $local == "aa1"){
          $cfg_folder  = "/home/www/domains_innova/ecommerce/dev.innovashop.tv/cgi-bin/nsc_admin/common/";
    }

	load_sys_data(); //Load $sys




	#####
	##### Esto es unicamente referencial
	#####	

	function load_sys_data() {

		global $sys,$cfg,$cfg_folder;
		
	
		if (file_exists($cfg_folder."/general.ex.cfg")){
			if ($handle = fopen($cfg_folder."/general.ex.cfg",'r')){
	
				while (!feof($handle)) {
					@list($type,$name,$value) = preg_split("/\||=/", fgets($handle),3);
					if ($type=='sys'){
						$sys[$name]=trim($value);
						#echo "$name = $value <br>";
					}elseif ($type=='conf' or $type=='conf_local'){
						$cfg[$name]=trim($value);
						#echo "$name = $value <br>";
					}
				}
				$max_e = $cfg['max_e'];
				$def_e = $cfg['def_e'];
			}else
				echo "no lee el file";
		}
		

		for ($i = 1; $i <= $cfg['max_e']; $i++) {
			if (file_exists($cfg_folder .'general.e'.$i.'.cfg')) {
				if ($handle = fopen($cfg_folder .'general.e'.$i.'.cfg','r')){
					#print $cfg_folder .'general.e'.$i.'.cfg';
					while (!feof($handle)) {
						@list($type,$name,$value) = preg_split("/\||=/", fgets($handle),3);
						#print "$type $name,$value<br>";
						if (($name == 'auth_dir' or $name == 'dbi_db' or $name == 'dbi_host' or $name == 'dbi_pw' or $name == 'dbi_user' or $name == 'app_title') and $type=='conf'){
							$cfg['emp.'.$i.'.'.$name]= trim($value);
						}
						if ($type=='sys' and $i == $cfg['def_e']){
							$sys[$name]=trim($value);
						}elseif (($type=='conf' or $type=='conf_local') and $i == $cfg['def_e']){
							$cfg[$name]=trim($value);
						}
					}
				}
			}
		}
	}




?>
