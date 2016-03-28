# dev shortcuts
function docker-compose-kill {
  cls
  docker-compose stop $args[0]
  docker-compose rm -f $args[0]
}

function docker-compose-build {
  cls
  docker-compose build $args[0]
  docker-compose up -d $args[0]
}

function dcl { cls ; docker-compose logs $args }
function dck { docker-compose-kill $args }
function dcb { docker-compose-build $args }

# git shortcuts
function gss { git status }
function gd { git diff }
function gdc { git diff --cached }

# shortcuts to docker-family tools (other than docker)
function dc { docker-compose $args }
function dm { docker-machine $args }

# shortcuts to docker itself
function di { docker images $args }
function dps { docker ps $args }
function dsh { docker-shell $args }

# shortcuts to docker containers
function docker-gc { docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc }
function docker-shell { docker exec -t -i $args /bin/bash --login }

# connect to virtualbox-based docker machine
function dock {
& "C:\Program Files\Docker Toolbox\docker-machine.exe" env default | Invoke-Expression
}

# change to some code directory under Code\*
function g {
    $xeger = Test-Path $home\Code\xeger\$args
    $allhands = Test-Path $home\Code\allhands\$args

    if ($xeger) {
      cd $home\Code\xeger\$args
    } elseif ($allhands) {
      cd $home\Code\allhands\$args
    } else {
      Write-Host "Can't find $args under Code"
    }
}

dock
