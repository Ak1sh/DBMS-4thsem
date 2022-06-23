#include<bits/stdc++.h>
using namespace std;
vector<int> Bfs(vector<int> adj[],int n,int start)
{
     vector<int>bfs;
      vector < int > vis(n, 0);
      queue < int > q;
      q.push(start);
      vis[start] = 1;
      while (!q.empty()) {
        int node = q.front();
        q.pop();
        bfs.push_back(node);

        for (auto it: adj[node]) {
          if (!vis[it]) {
            q.push(it);
            vis[it] = 1;
          }
        }
      }

      return bfs;
    }


int main()
{
    int m,n;
    cout<<"Enter the no of nodes:";
    cin>>n;
    cout<<"Enter the no of edges:";
    cin>>m;
    vector<int> adj[n+1];
    for(int i=0;i<m;i++)
    {
        int a,b;
        cout<<"Enter edges ";
        cin>>a>>b;
        adj[a].push_back(b);
        
    }
    int start;
    cout<<"Enter the start:";
    cin>>start;
    vector<int>ans =Bfs(adj,n,start);
    for(auto it: ans)
    cout<<it<<endl;

    return 0;
}
