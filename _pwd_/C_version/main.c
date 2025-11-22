#include <stdio.h>
#include <string.h> // for strlen && strcpy 
#include <unistd.h> // for the getcwd fucntion
#include <limits.h> // for path max





int main(int ac , char **av) {

	if(ac == 2) {
		if(strcmp(av[1] , "-h") == 0 || strcmp(av[1] , "--help") == 0) {
			printf("usage: my_c_pwd and enter hhhh \n");
			return 0;
		}

		if(strcmp(av[1] , "-v") == 0|| strcmp(av[1] , "--version") == 0) {
			printf("version 1.0.0.0 \n");
			return 0;
		}
	}


	char buffer[PATH_MAX];

	if(getcwd(buffer , PATH_MAX) != NULL){
		printf("%s\n" ,buffer );
	}else {
		printf("heeey there is  a probleme with 'getcwd' \n");
		return 1;
	}

	return 0;
}
