#include <iostream>
#include <cmath>
#include <vector>

int binary_search(std::vector<int>& );
int find_closest(std::vector<int>&, int& );

int main()
{
    std::vector<int> v;
    int key = -3;

    v.push_back(1);
    v.push_back(5);
    v.push_back(12);
    v.push_back(20);
    v.push_back(23);
    v.push_back(39);

    //std::cout << binary_search(v,22) << std::endl;
    int pos = find_closest(v,key);
    std::cout << v[pos] << std::endl;
    return 0;
}

int binary_search(std::vector<int>& v, int& x)
{
    int from = 0;
    int to = v.size();
    std::cout << "to : " << to << std::endl;
    int mid;

    while (from != to) 
    {
        mid = (from + to) / 2;
        
        if (v[mid] > x) 
        {
            to = mid;
        } else 
        { 
            from = mid + 1;
        }
    }

    return from;
}

int find_closest(std::vector<int>& v, int& x)
{
    int pos = binary_search(v, x);
    std::cout << "pos : " << pos << std::endl;

    // return pos == 0 ? 0 :
    //        pos == v.size() ? v.size() - 1 :
    //        x - v[pos - 1] < v[pos] - x ? pos - 1 : pos;
    
    if ( pos == 0 ) 
        return 0;


    if (pos == v.size())
        return  v.size() - 1;
    else if (x - v[pos - 1] < v[pos] - x)
        return pos - 1 ;
    else 
        return pos;

}


#if 0 
int getClosestK(std::vector<int>& v, int x) 
{
    int low = 0;
    int high = v.size() - 1;

    // if (high < 0)
    //    throw new IllegalArgumentException("The array cannot be empty");

    while (low < high) {

        int mid = (low + high) / 2;
        
        // assert(mid < high);

        int d1 = std::abs(a[mid] - x);
        int d2 = std::abs(a[mid+1] - x);

        if (d2 <= d1)
        {
            low = mid+1;
        }
        else
        {
            high = mid;
        }
    }
    return a[high];
}
#endif 