# util
# `convert-source-to-snippet-body.py`
Convert a source code to a string meant to be used as a snippet body in "*.code-snippets".
## Example
### FROM
```
#include <bits/stdc++.h>
using namespace std;

/***** MAIN *****/
signed main() {
  cout << "";
  cout << "\n";
  return 0;
}
/***** MAIN *****/
```
### TO
```
"#include <bits/stdc++.h>",
"using namespace std;",
"",
"/***** MAIN *****/",
"signed main() {",
"  cout << \"\";",
"  cout << \"\\n\";",
"  return 0;",
"}",
"/***** MAIN *****/"
```
