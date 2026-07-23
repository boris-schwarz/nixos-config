{...}:{
	programs.git = {
		enable = true;
		config = {
			init.defaultBranch = "main";
			user = {
				name = "Boris Schwarz";
				email = "schwarz_boris@hotmail.com";
			};
		};
	};
}
