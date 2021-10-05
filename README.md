# Health_Challenge
## commit 하는 법
1. fork이후 본인의 디렉토리를 만듭니다.
2. example을 참고해 본인의 디렉토리에 commit.sh 파일을 옮긴 후 내부 name 부분을 본인의 이름으로 수정합니다
```
...
88: echo "git commit -m [name] $EXERCISE"
-> echo "git commit -m [lcy] $EXERCISE"
...
95: 			git commit -m "[name] $EXERCISE"
-> 			git commit -m "[lcy] $EXERCISE"
```
3. commit.sh 파일을 실행해 commit후 push 하고 PR을 날려주시면 됩니다~
