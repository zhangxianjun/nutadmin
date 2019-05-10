package group.aliren.nutadmin.entity;

import lombok.Data;

@Data
public class ResourceEntity {
    public int resourceId;
    public String name;
    public int catalogId;
    public String url;
}
