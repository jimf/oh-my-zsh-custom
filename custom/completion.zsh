# Complete packages.
[ -d ~/svn/packages ] && compctl -g "~/svn/packages/*/(:t)" pkg
[ -d /opt/packages ] && compctl -g "/opt/packages/*/(:t)" pkg
