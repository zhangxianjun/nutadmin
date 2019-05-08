package group.aliren.nutadmin.view;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HeaderView implements TemplateDirectiveModel {
    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        List<String> titles = new ArrayList<>();
        titles.add("西湖区");
        titles.add("余杭区");
//
//        <img src="../static/image/logo.png" style="width:115px; height: 62px; vertical-align: middle">
//        <#list navList as l>
//            <button onclick="openIframe(${l.resourceId})">${l.title}</button>
//        </#list>
//    </nav>
//</header>

        StringBuilder sb = new StringBuilder();
        sb.append("<header>");
        sb.append("<nav>");
        sb.append("<img src=\"../static/image/logo.png\" style=\"width:115px; height: 62px; vertical-align: middle\">");
        for (int i = 0; i < titles.size(); i++) {
            sb.append("<button onclick=\"openIframe(${l.resourceId})\">${l.title}</button>");
        }

        sb.append("</header>");
        sb.append("</nav>");

        environment.getOut().write(sb.toString());
    }
}
