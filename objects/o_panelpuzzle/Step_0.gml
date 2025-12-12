if menu == true and arranged == false
{
    if amount = 1
{
    array_panels = [0]
    right_answer = [0]
}
if amount = 2
{
    array_panels = array_shuffle([0,1])
    right_answer = [0,1]
}
if amount = 3
{
    array_panels = array_shuffle([0,1,2])
    right_answer = [0,1,2]
}
if amount = 4
{
    array_panels = array_shuffle([0,1,2,3])
    right_answer = [0,1,2,3]
}
    arranged = true
}

chosen0 = array_contains(panel_selection,array_panels[0])
thechosen1 = array_contains(panel_selection,array_panels[1])
chosen2 = array_contains(panel_selection,array_panels[2])
chosen3 = array_contains(panel_selection,array_panels[3])