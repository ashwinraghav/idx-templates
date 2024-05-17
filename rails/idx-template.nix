{ pkgs, version ? "latest", importAlias ? "@/*",  language ? "ts", packageManager ? "pnpm", srcDir ? false, eslint ? false, app ? false, tailwind ? false, ... }: {
	
    packages = [
      pkgs.ruby
      pkgs.nodejs
      pkgs.yarn
      pkgs.sqlite
    ];

    bootstrap = ''
       gem install rails
    '';
}
