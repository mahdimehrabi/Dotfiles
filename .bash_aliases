alias ofr="sudo openconnect  -u yas1717 cfr.hi-fast.me"
alias ofr2="sudo openconnect  -u yas1717 cfrp.hi-fast.me"
alias ode="sudo openconnect  -u yas1717 cde.hi-fast.me"
alias ode2="sudo openconnect  -u yas1717 cde2.hi-fast.me"
alias ouk="sudo openconnect  -u yas1717 cuk.hi-fast.me"
alias oca="sudo openconnect  -u yas1717 xca.hi-fast.me"
alias oc2a="sudo openconnect  -u yas1717 cca.hi-fast.me"

alias pmp="python manage.py" 
alias gpo='git push origin'
alias activeenv='source ../env/bin/activate'

# docker
alias doc="sudo docker-compose"
alias proddoc="sudo docker-compose -f docker-compose.prod.yml"

alias execdj="sudo docker-compose exec web python manage.py"
alias prodexecdj="sudo docker-compose -f docker-compose.prod.yml exec web python manage.py"

alias doclogs="sudo docker-compose logs -f"
alias proddoclogs="sudo docker-compose -f docker-compose.prod.yml logs -f"
