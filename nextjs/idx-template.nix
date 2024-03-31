{ pkgs, version ? "latest", importAlias ? "@/*",  language ? "ts", packageManager ? "pnpm", srcDir ? false, eslint ? false, app ? false, tailwind ? false, ... }: {
	
    packages = [
			pkgs.nodejs_20
			pkgs.yarn
			pkgs.nodePackages.pnpm
			pkgs.bun
    			# pkgs.curl
			# pkgs.toybox
    ];

    bootstrap = ''
			mkdir "$out"
			# mkdir -p /home/user/.pnpm-store
			# cd /home/user/.pnpm-store
			# curl -0 "https://firebasestorage.googleapis.com/v0/b/devfest-c4c8f.appspot.com/o/p.tar.gz?alt=media&token=5f99226c-8b17-4ffb-b5c3-fcf15ccbcd3a" -o p.tar.gz
			# wget -O p.tar.gz "https://firebasestorage.googleapis.com/v0/b/devfest-c4c8f.appspot.com/o/p.tar.gz?alt=media&token=5f99226c-8b17-4ffb-b5c3-fcf15ccbcd3a"
			# tar -mxf p.tar.gz
			# rm p.tar.gz
			# pnpm config set store-dir /home/user/.pnpm-store
			# pnpm create next-app "$out" \
			#		--import-alias=${importAlias} \
			#		--${language} \
			#		--use-pnpm \
			#		${if eslint then "--eslint" else "--no-eslint" } \
			#		${if srcDir then "--src-dir" else "--no-src-dir" } \
			#		${if app then "--app" else "--no-app" } \
			#		${if tailwind then "--tailwind" else "--no-tailwind" }

			npx create-next-app -y --example https://github.com/ashwinraghav/ashwin-example "$out"

			mkdir -p "$out"/.idx
  		cp ${./dev.nix} "$out"/.idx/dev.nix
    '';
}
