npm outdated --json > _v.json
          npm outdated --json > _v.json

          function update {
            local NAME=$1
            node -e "
            const fs = require('fs')
            const version = fs.readFileSync('./_v.json', 'utf-8')
            const dep = version['$NAME']
            if(dep.current !== dep.latest) { 
            const pkg = JSON.parse(fs.readFileSync('./package.json', 'utf-8'))
            pkg.dependencies['$NAME'] = '$TARGET_VERSION'
            fs.writeFileSync('./package.json', JSON.stringify(pkg, undefined, 2), 'utf-8')
            }
            "
          }

          update yart-cli
          update yart-dev-server

          rm _v.json
          
          yarn

          git add .
          git commit -m "note:update version"
          git push origin master
