
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

#Aliases for checking github projects. 
alias ptcheck='gitcheck taniman profit-trailer ProfitTrailer'
alias ptfcheck='gitcheck mehtadone PTFeeder PT-Feeder'
alias ptncheck='gitcheck Roy4lz ptnotifications PT-Notification'
alias pttcheck='gitcheck bTayFla PtTracker PT-Tracker'

#Aliases for retrieving the archive for the most recent release.
alias ptget='wget $(ptcheck | grep download)'
alias ptfget='wget $(ptfcheck | grep download | grep -v raspberry-pi)'
alias ptnget='wget $(ptncheck | grep download)'
alias pttget='wget $(pttcheck | grep download | grep linux)'

#Misc Aliases 
alias pt='/etc/init.d/pt'
alias ptt='/etc/init.d/ptt'
alias ptf='/etc/init.d/ptf'
alias ptlog='tail -n $(tput lines) -f /var/log/pt.log'
alias pttlog='tail -n $(tput lines) -f /var/log/ptt.log'
alias ptflog='tail -n $(tput lines) -f /var/log/ptf.log'
alias ptfedit='nano ~/pt-feeder/config/appsettings.json'
