#~/.bash_aliases

#ProfitTrailer Scripts: https://github.com/RchGrav/pt-scripts

#Function to check github, gitcheck requires $1=username, $2=repo, $3=title.
gitcheck() {
    gitapi="$(curl --silent "https://api.github.com/repos/$1/$2/releases/latest" | sed 's/%/%%/g')"
    latest="$(echo "$gitapi" | grep -Po '"published_at": "\K.*?(?=")')"
    release="$(echo "$gitapi" | grep -Po '"tag_name": "\K.*?(?=")')"
    url="$(echo "$gitapi" |grep -Po '"browser_download_url": "\K.*?(?=")')"
    daysago="$(( ($(date -u -d now +%s) - $(date -u -d $latest +%s) + 43200 )/(86400) ))"
    case "$daysago" in
        0) when="today" ;;
        1) when="yesterday" ;;
        *) when="$daysago days ago" ;;
    esac
    printf "$3's latest release $release came out $when.\n$url\n"
}
giturls() {
    gitapi="$(curl --silent "https://api.github.com/repos/$1/$2/releases" | sed 's/%/%%/g')"
    urls="$(echo "$gitapi" |grep -Po '"browser_download_url": "\K.*?(?=")')"
    printf "$urls\n"
}

#Aliases for checking github projects. 
alias ptcheck='gitcheck taniman profit-trailer ProfitTrailer'
alias ptfcheck='gitcheck mehtadone PTFeeder PT-Feeder'
alias ptfbcheck='giturls mehtadone ptfeeder-beta "PT-Feeder Beta"'
alias ptncheck='gitcheck Roy4lz ptnotifications PT-Notification'
alias pttcheck='gitcheck bTayFla PtTracker PT-Tracker'

#Aliases for retrieving the archive for the most recent release.
alias ptget='wget -q --show-progress $(ptcheck | grep download)'
alias ptfget='wget -q --show-progress $(ptfcheck | grep download | grep -v raspberry-pi)'
alias ptfbget='wget -q --show-progress $(ptfbcheck | grep download)'
alias ptnget='wget -q --show-progress $(ptncheck | grep download)'
alias pttget='wget -q --show-progress $(pttcheck | grep download | grep linux)'

#Misc Aliases 
alias pt='/etc/init.d/pt'
alias ptt='/etc/init.d/ptt'
alias ptf='/etc/init.d/ptf'
alias ptn='/etc/init.d/ptn'

alias ptlog='tail -n $(tput lines) -f /var/log/pt.log'
alias pttlog='tail -n $(tput lines) -f /var/log/ptt.log'
alias ptflog='tail -n $(tput lines) -f /var/log/ptf.log'
alias ptnlog='tail -n $(tput lines) -f /var/log/ptn.log'
alias stopall='pt stop & ptf stop & ptt stop & ptf stop & wait'
alias logs='tail -f /var/log/pt.log /var/log/ptf.log /var/log/ptt.log /var/log/ptn.log'
alias ptfedit='nano -S ~/pt-feeder/config/appsettings.json'
alias ptfview='cat ~/pt-feeder/config/appsettings.json | jq .'
alias ptfcd='cd ~/pt-feeder/config/'
alias ptcd='cd ~/ProfitTrailer/'
