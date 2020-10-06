
### 安裝方法
1. tap repo: `brew tap McDull-GitHub/tsocks-homebrew`
2. install tsocks: `brew install --HEAD tsocks` 
3. edit configuration file: `vim /usr/local/etc/tsocks.conf`
4. set socks5 server as localhost:9999: 
```
server = localhost
server_port = 9999
```
5. check if it works: `tsocks curl ip.sb`
6. untap repo: `brew tap McDull-GitHub/tsocks-homebrew`

### 一鍵腳本
```
brew tap McDull-GitHub/tsocks-homebrew
brew install --HEAD tsocks
brew untap McDull-GitHub/tsocks-homebrew
echo "server_port = " >> /usr/local/etc/tsocks.conf
vim /usr/local/etc/tsocks.conf
tsocks curl ip.sb
```