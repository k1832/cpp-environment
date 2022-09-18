#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using P = pair<int, int>;

#define LOG(variable) cerr << #variable":\t" << (variable) << "\n"
#define LOGCON(i, container) for(int (i) = 0; (i) < (container).size(); ++(i)) cerr << (i) << ":\t" << (container)[(i)] << "\n"
#define REP(i, n) for (int i = 0; i < (n); ++i)
#define REPS(i, r, n) for (int i = (r); i < (n); ++i)
#define REPR(i, n) for(int i = (n); i >= 0; --i) // from n to 0
#define REPRS(i, n, r) for(int i = (n); i >= (r); --i) // from n to r
#define REPOBJ(itr, obj) for(auto itr = (obj).begin(); itr != (obj).end() ; ++itr)
#define REPROBJ(itr, obj) for(auto itr = (obj).rbegin(), e = (obj).rend(); itr != e; ++itr)
#define COUTB(x) cout << (x) << "\n"
#define COUTS(x) cout << (x) << " "
#define PB push_back
#define SORT(obj) sort((obj).begin(), (obj).end())
#define SORTR(obj) sort((obj).begin(), (obj).end(), greater<>())
#define ALL(obj) (obj).begin(), (obj).end()
#define PI (acos(-1))
/* Conditional template start */
{% if mod %}
#define MOD {{ mod }}
{% else %}
#define MOD 1000000007
{% endif %}
{% if yes_str %}
const string YES = "{{ yes_str }}";
{% endif %}
{% if no_str %}
const string NO = "{{ no_str }}";
{% endif %}
/* Conditional template end */
template <class T> using max_heap = priority_queue<T>;
template <class T> using min_heap = priority_queue<T, vector<T>, greater<>>;
template<typename T = int>
T in() {T a; cin >> a; return a;}

// Return "signed" in case of using "#define int long long"
signed main() {

  cout << "\n";
  return 0;
}
