#include <unordered_map>
#include <vector>

static const int TOTAL_COUNT = 100000;

__attribute__((export_name("mapCreate")))
std::unordered_map<int, int> *map_create() {
    auto ptr = new std::unordered_map<int, int>;
    return ptr;
}

__attribute__((export_name("mapSet")))
void map_set(std::unordered_map<int, int> *mp, int key, int value) {
    mp->insert({ key, value });
}

__attribute__((export_name("mapFree")))
void map_free(std::unordered_map<int, int> *mp) {
    delete mp;
}

__attribute__((export_name("listCreate")))
std::vector<int> *list_create() {
    auto ptr = new std::vector<int>;
    return ptr;
}

__attribute__((export_name("listPush")))
void list_push(std::vector<int> *list, int value) {
    list->push_back(value);
}

__attribute__((export_name("listFree")))
void list_free(std::vector<int> *list) {
    delete list;
}
