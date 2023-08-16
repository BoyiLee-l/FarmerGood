//
//  GroupedSection.swift
//  Agriculturalknowledge
//
//  Created by user on 2020/9/14.
//  Copyright © 2020 abc. All rights reserved.
//

struct GroupedSection<SectionItem : Hashable, RowItem> {

    var sectionItem : SectionItem
    var rows : [RowItem]

    static func group(rows : [RowItem], by criteria : (RowItem) -> SectionItem) -> [GroupedSection<SectionItem, RowItem>] {
        let groups = Dictionary(grouping: rows, by: criteria)
        return groups.map(GroupedSection.init(sectionItem:rows:))
    }

}
