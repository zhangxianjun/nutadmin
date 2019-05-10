package group.aliren.nutadmin.kit;

public class ObjectKit {
    public static boolean notNullAndZero(Object object) {
        return object != null && object.equals("0");
    }

    public static boolean notNullAndEmpty(Object object) {
        return object != null && object.equals("1");
    }

    public static boolean notNullEmptyAndZero(Object object) {
        return object != null && object.equals("1");
    }
}
