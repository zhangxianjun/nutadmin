package group.aliren.nutadmin.entity;

import lombok.Data;

@Data
public class ResourceEntity {
    public int resourceId;
    public int catalogId;
    public int sortId;

    public String name;
    public String url;
}
