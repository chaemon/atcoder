#include <bits/stdc++.h>
using namespace std;


long long N;
long long M;
vector<int> a;

void solve(){
	list<int> l;
	vector<list<int>::iterator> p;
	for(int i = 0;i < N;i++){
		l.push_back(i);
		auto it = l.end();
		it--;
		p.push_back(it);
	}
	for(int i = 0;i < M;i++){
		l.erase(p[a[i]]);
		l.push_front(a[i]);
		p[a[i]] = l.begin();
	}
	for(auto &&it:l){
		cout<<it+1<<endl;
	}
}

// Generated by 1.1.6 https://github.com/kyuridenamida/atcoder-tools  (tips: You use the default template now. You can remove this line by using your custom template)
int main(){
	std::cin >> N;
	std::cin >> M;
	a.assign(M, 0);
	for(int i = 0 ; i < M ; i++){
		std::cin >> a[i];
		a[i]--;
	}
	solve();
	return 0;
}